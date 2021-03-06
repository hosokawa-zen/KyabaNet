//
// Copyright (c) 2020 Related Code 
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import RealmSwift

//-------------------------------------------------------------------------------------------------------------------------------------------------
class Group: SyncObject {

	@objc dynamic var chatId = ""

	@objc dynamic var name = ""
	@objc dynamic var ownerId = ""
    @objc dynamic var pictureAt: Int64 = 0
    
	@objc dynamic var isDeleted = false

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func update(name value: String) {

		if (name == value) { return }

		let realm = try! Realm()
		try! realm.safeWrite {
			name = value
			syncRequired = true
			updatedAt = Date().timestamp()
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func update(isDeleted value: Bool) {

		if (isDeleted == value) { return }

		let realm = try! Realm()
		try! realm.safeWrite {
			isDeleted = value
			syncRequired = true
			updatedAt = Date().timestamp()
		}
	}

    //---------------------------------------------------------------------------------------------------------------------------------------------
    func update(pictureAt value: Int64) {

        if (pictureAt == value) { return }

        let realm = try! Realm()
        try! realm.safeWrite {
            pictureAt = value
            syncRequired = true
            updatedAt = Date().timestamp()
        }
    }
}
