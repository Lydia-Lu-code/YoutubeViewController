import UIKit

struct VideoContent {
    let title: String
    let thumbnailURL: String
}

class HomeShortsFrameCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var videoContents: [VideoContent] = []
    var welcome: Welcome?
    static let identifier = "HomeShortsFrameCollectionView"
      
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        self.isScrollEnabled = false
        self.delegate = self
        self.dataSource = self
        self.register(ShortsCollectionViewCell.self, forCellWithReuseIdentifier: HomeShortsFrameCollectionView.identifier)
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return welcome?.items.count ?? videoContents.count
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeShortsFrameCollectionView.identifier, for: indexPath) as! ShortsCollectionViewCell
    
            if let welcome = welcome {
                let item = welcome.items[indexPath.item]
                cell.titleLabel.text = item.snippet.title
                if let url = URL(string: item.snippet.thumbnails.high.url) {
                    cell.setImage(from: url)
                }
            } else {
                let videoContent = videoContents[indexPath.item]
                cell.titleLabel.text = videoContent.title
                if let url = URL(string: videoContent.thumbnailURL) {
                    cell.setImage(from: url)
                }
            }
    
            return cell
        }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 30) / 2
        return CGSize(width: width, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
