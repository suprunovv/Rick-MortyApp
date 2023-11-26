//
//  CharacterDetailsViewController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 18.11.2023.
//

import Photos
import UIKit

final class CharacterDetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    private let startView = CharacterDetailsView()
    var model: PersonModel?
    var charName = ["Species", "Gender", "Status", "Id"]
    var charResult = [String]()
    
    override func loadView() {
        view = startView
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true 
    }
    
    convenience init(model: PersonModel) {
        self.init()
        startView.avatarImageView.image = model.image
        self.model = model
        self.charResult = [model.species, model.gender, model.status, model.id]
    }
    
    private func setView() {
        setNavigationBar()
        startView.informationTabelView.delegate = self
        startView.informationTabelView.dataSource = self
        startView.informationTabelView.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.reuseId)
        startView.nameLabel.text = model?.personName
        addActionPhoto()
        imagePicker.delegate = self
    }
    
    
    private func setNavigationBar() {
        
        self.navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.barTintColor = .white
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowRadius = 0.1
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.2
        
        let navigationBackButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(goBack))
        navigationBackButton.tintColor = .black
        let iconBar = UIImageView(image: UIImage(named: "logoRM"))
        
        navigationItem.leftBarButtonItem = navigationBackButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: iconBar)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func addActionPhoto() {
        startView.cameraButton.addTarget(self, action: #selector(alertTest), for: .touchUpInside)
    }
    
    @objc func alertTest() {
        let actionSheet = UIAlertController(title: "Загрузите изображение", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = .camera
                        imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
                    } else {
                        let alert = UIAlertController(title: "Ошибка", message: "Камера не доступна", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
        }
        let gelatyAction = UIAlertAction(title: "Галерея", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let closeAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(gelatyAction)
        actionSheet.addAction(closeAction)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            startView.avatarImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension CharacterDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.reuseId, for: indexPath) as? DetailsTableViewCell else { return UITableViewCell() }
        cell.nameDetailsLabel.text = charName[indexPath.row]
        cell.resultDetailsLabel.text = charResult[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderDetailsTabel()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}


