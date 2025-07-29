import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var cowButton: UIButton!
    @IBOutlet weak var lionButton: UIButton!
    @IBOutlet weak var elephantButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Настройка заголовка
        titleLabel.text = "🎵 Звуки Животных 🎵"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .systemBlue
        
        // Настройка кнопок
        setupAnimalButton(catButton, title: "🐱 Кот", backgroundColor: .systemOrange)
        setupAnimalButton(dogButton, title: "🐶 Собака", backgroundColor: .systemBrown)
        setupAnimalButton(cowButton, title: "🐄 Корова", backgroundColor: .systemPink)
        setupAnimalButton(lionButton, title: "🦁 Лев", backgroundColor: .systemYellow)
        setupAnimalButton(elephantButton, title: "🐘 Слон", backgroundColor: .systemGray)
        
        // Настройка фона
        view.backgroundColor = .systemBackground
    }
    
    private func setupAnimalButton(_ button: UIButton, title: String, backgroundColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = backgroundColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
        
        // Добавляем анимацию нажатия
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpOutside)
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc private func buttonReleased(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
    }
    
    // MARK: - Actions
    @IBAction func catButtonTapped(_ sender: UIButton) {
        AudioManager.shared.playSound(named: "cat")
        animateButton(sender)
    }
    
    @IBAction func dogButtonTapped(_ sender: UIButton) {
        AudioManager.shared.playSound(named: "dog")
        animateButton(sender)
    }
    
    @IBAction func cowButtonTapped(_ sender: UIButton) {
        AudioManager.shared.playSound(named: "cow")
        animateButton(sender)
    }
    
    @IBAction func lionButtonTapped(_ sender: UIButton) {
        AudioManager.shared.playSound(named: "lion")
        animateButton(sender)
    }
    
    @IBAction func elephantButtonTapped(_ sender: UIButton) {
        AudioManager.shared.playSound(named: "elephant")
        animateButton(sender)
    }
    
    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .allowUserInteraction) {
            button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                button.transform = CGAffineTransform.identity
            }
        }
    }
}