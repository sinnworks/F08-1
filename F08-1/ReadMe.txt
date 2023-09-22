[V] add efmodels
====
會員系統
[V] add 註冊會員功能
	add Models/Infra/HashUtility.cs
	add AppSettings, <add key="salt" value="ar!Zu@#$D691RR"/>
	add Models/ViewModels/RegisterVm.cs
	add RegisterExts class, 擴充方法 ToEFModel(RegisterVM)
	add Controllers/MembersController
		add Register action(Get, Post)
		add Views/Members/Register.cshtml, RegisterConfirm.cshtml
		modify _Layout.cshtml, add Register link

[V] 實作 新會員 Email確認功能
	會員啟用的 url : /Members/ActiveRegister?memberId=99&confirmCode=tttttttttttttttttttttt
	modify MembersController
		add ActiveRegister(memberId, confirmCode)
	add Views/Members/ActiveRegister.cshtml

[-]實作 登入/登出網站
	只有帳密正確而且已正式開通的會員才允許登入, 實作之前, 請先各別建立一個已/未開通的會員記錄,方便測試
	modify web.config, add Authenthcation node
	add Models/ViewModels/LoginVm.cs
	modify MembersController
		add Login action(Get, POST)
		add Logout action(get only)
	modify _layout, 加入 login/logout link
	驗證: 目前在沒登入時,會自動判斷權限, 無法檢視 About page; 登入/登出功能已實作

[-]實作 修改個人基本資料-建立會員中心頁
	add Models/ViewModels/EditProfileVm.cs
	add Models/ViewModels/MemberExts class, 擴充方法 ToEditProfileVm(Member)

	modify MembersController
		add Index action 會員中心頁, 在登入成功之後會導向到此頁
			add Views/Members/Index.cshtml(空白範本), 填入二個超連結 : ""修改個人基本資料", "重設密碼"
		修改 web.config裡的 defaultUrl
		add EditProfile action(Get, POST)

[-] 實作變更密碼
	add Models/ViewModels/EditPasswordVm.cs
	modify MembersController
		add EditPassword action(Get, POST)
		add Views/Members/EditPassword.cshtml(用 create template)

[-]實作 忘記密碼/重設密碼
	add Models/Infrastructures/EmailHelper class, 撰寫寄信的功能
	暫時建立 ~/files/ folder,用來放寄信的測試內容

	add /Models/ViewModels/ForgotPasswordVm.cs
	modify MembersController
		add ForgetPassword action(Get,POST)
		add ForgetPassword view page(用 create template)

	add /Views/Members/ForgetPasswordConfirm view page(空白範本)

	修改 Views/Members/Login.chshtml, 加入'忘記密碼'的連結

[-]實作重設密碼
	add Models/Infra/DAHelper
	add Models/ViewModels/ResetPasswordVM, 用來輸入新密碼
	modify MembersController , add ResetPassword action(httpget action)
	add /Views/Members/ResetPassword.cshtml(create 範本)
	modify MembersController , add ResetPassword action(httpPost action)
	add ConfirmResetPassword.csthml(空白範本)
===========
前台購物車功能
[-] 建立商品清單頁
	add ProductIndexVm.cs
	add ProductExts,撰寫擴充方法
	add ProductsController(新增空白controller), add Index action
		add Index.cshtml(list template), 
		- 撰寫js,實作加入購物車功能Default
		- 移除 AddNew hyperlink
		- 只有在已登入狀況下,才顯示 'add to cart' button

[-]顯示購物車資訊, 實作增減數量的功能
	add CartVm.cs ,CartItemVm ,顯示一筆購物車資料及其明細
	add CartController, 實作將商品加入購物車的功能
		AddItem action, 將商品加入購物車
		Info action, 顯示購物車內容, 此時還沒實作數量的增減功能

	modify app_start/RouteConfig.cs , 預設為 Products/Index
	modify _Layout.cshtml, 加入購物車的連結
	modify CartController
		add UpdateItem action
	add Cart/ Info view pge(用 list 範本, model 是 CartVm)

[-]實作 結帳作業
	- add enum OrderStatus
	- add CheckoutVm.cs
	- modify CartController, add Checkout action
	- add Checkout view page(用create 範本, model是 CheckoutVm)
	- add ConfirmCheckout view page(空白template)

[working on]發confirm email給新註冊會員