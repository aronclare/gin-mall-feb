package e

const (
	SUCCESS       = 200
	Error         = 500
	InvalidParams = 400

	// User 模块错误 3xxxx
	ErrorExistUser             = 30001
	ErrorFailEncryption        = 30002
	ErrorExistUserNotFound     = 30003
	ErrorNotCompare            = 30004
	ErrorAuthCheckTokenFail    = 30005
	ErrorAuthCheckTokenTimeout = 30006
	ErrorUploadFail            = 30007

	// 邮件发送
	ErrorSendEmail = 30009
	ErrorAuthToken = 30008

	// Product 模块错误 4xxxx
	ErrorDatabase = 40001
)
