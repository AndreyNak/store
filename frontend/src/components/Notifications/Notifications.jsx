import Icon from "../../bundles/Icon";
import './notifications.scss'
import sound from '../../assets/notification.mp3'
import { useEffect, useRef, useState } from "react";
import consumer from "../../lib/channels/consumer";
import { useGenericData } from "../../bundles/GeneralContext";
import { get, patch } from "../../lib/http";

const Notifications = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [notifications, setNotifications] = useState([]);
  const { currentUser } = useGenericData();
  const notificationsRef = useRef(null);
  const bellRef = useRef(null);


  useEffect(() => {
    get('notifications').then((data) => setNotifications(data))
  }, [])

  useEffect(() => {
    const subscription = consumer.subscriptions.create(
      { channel: "NotificationsChannel", user_id: currentUser.id },
      {
        received(data) {
          new Audio(sound).play().catch(()=> {console.log('spam')})
          setNotifications((prevNotifications) => [data, ...prevNotifications]);
        }
      }
    );

    return () => {
      subscription.unsubscribe();
    };
  }, [currentUser.id]);

  useEffect(() => {
    const handleClickOutside = (event) => {
      const isOutsideNotifications = !notificationsRef.current.contains(event.target);
      const isOutsideBell = !bellRef.current.contains(event.target);

      (isOutsideNotifications && isOutsideBell) && setIsOpen(false);
    };

    isOpen && document.addEventListener('mousedown', handleClickOutside);

    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [isOpen]);

  const markAsRead = (id) => {
    patch(`notifications/${id}/mark_as_read`).then((recitedNotification) => {
      setNotifications(notifications.filter(notification => notification.id !== recitedNotification.id));
    });
  };


  const handleCallSound = () => {
    setIsOpen(!isOpen);
  }

  const countNewNotifications = () => {
    if (notifications.length > 0) {
      return <div className="count-notifications">{notifications.length > 99 ? '99+' : notifications.length}</div>
    } else {
      return null
    }
  }

  return (
    <div className="main">
      <div onClick={handleCallSound} className="bell" ref={bellRef}>
        <Icon name="bell" />
        {countNewNotifications()}
      </div>

      {isOpen && (
        <div className="notifications"  ref={notificationsRef}>
          <h2>Notifications</h2>
          {notifications.length === 0 ? (
            <p>No notifications</p>
          ) : (
            <div style={{ height: '500px', overflow: 'auto' }}>
              {notifications.map((notification) => (
                <div className="d-flex my-2 border-bottom justify-content-between"key={notification.id}>
                  <span>{notification.message}</span>
                  <div>
                    <button className="read-button" onClick={() => markAsRead(notification.id)}>Mark as read</button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}

export default Notifications;