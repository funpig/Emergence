import Foundation

/// A simple pattern for saying "I take some shows and will occasionally get more"

protocol ShowEmitter {
    var title: String { get }
    var numberOfShows: Int { get }

    func showAtIndexPath(index: NSIndexPath) -> Show
    func getShows()
    func onUpdate( callback: (shows:[Show]) -> () )
}

class StubbyEmitter: NSObject, ShowEmitter {
    let title:String
    var numberOfShows = 0
    var stubs = [Show]()

    init(title: String) {
        self.title = title
        super.init()
    }

    func showAtIndexPath(index: NSIndexPath) -> Show {
        return stubs[index.row]
    }

    func getShows() {
        stubs = [Show.stubbedShow(),Show.stubbedShow(),Show.stubbedShow(),Show.stubbedShow()]
        numberOfShows = stubs.count
    }

    func onUpdate( callback: (shows:[Show]) -> () ) {
        callback(shows:stubs)
    }
}