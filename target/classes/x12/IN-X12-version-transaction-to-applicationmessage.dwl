%dw 2.0
output application/json
---
payload.TransactionSets.v004010."850" map ( v850 , indexOfV850 ) -> {
	B2BMessage: {
		Header: {
			ReceiverID: v850.Group.GS03 default "",
			SenderID: v850.Group.GS02 default "",
			MessageID: v850.Interchange.ISA13 as String default ""
		},
		Data: {
			PurchaseOrder: {
				PONumber: v850.Heading."020_BEG".BEG03 default "",
				BuyerEmailID: v850.Heading."060_PER".PER04,
				CustomerId: v850.Group.GS02 default "",
				PODate: v850.Heading."020_BEG".BEG05 as String default ""
			}
		},
		customAttributes: [{
			alias: "purchaseOrderNumber",
			values: v850.Heading."020_BEG".BEG03 default ""
		}]
	}
}