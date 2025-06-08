import Foundation
import Combine

final class NotificationsViewModel {
    @Published private(set) var notifications: [NotificationItem] = MockData.notifications
}
