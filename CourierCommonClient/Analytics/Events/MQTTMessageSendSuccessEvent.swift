import Foundation
import CourierCore

class MQTTMessageSendSuccessEvent: IAnalyticsEvent {
    var name = EventName.mqttMessageSendSuccess
    var properties = [String: String]()

    init(networkType: String? = nil, qos: QoS, topic: String, sizeBytes: Int) {
        properties[EventProperty.networkType] = networkType ?? NetworkType.unknown.trackingId
        properties[EventProperty.topic] = topic
        properties[EventProperty.qos] = String(qos.rawValue)
        properties[EventProperty.sizeBytes] = String(sizeBytes)
    }
}

extension ICourierAnalyticsManager {
    func sendMQTTMessageSendSuccessEvent(networkType: String? = nil, qos: QoS, topic: String, sizeBytes: Int, trackingSource: CourierAnalyticsService.Source) {
        let event = MQTTMessageSendSuccessEvent(networkType: networkType, qos: qos, topic: topic, sizeBytes: sizeBytes)
        send(event.name, properties: event.properties, source: trackingSource)
    }
}
