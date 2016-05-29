#!/bin/bash

captcha = "x"
for num in {10..100}
do
 function cap {
               curl --cookie ./cookie 'https://uat-snapp-store.avaya.com/jsdn/captcha/captchaChallenge?language=en_us&country=' --insecure > jeher.png
				captcha=$(python captchabreaker.py)
				echo $captcha
           }

 function register {
echo "registering"
	curl -b ./cookie 'https://uat-snapp-store.avaya.com/jsdn/register/customerSelfRegistration.action' --data 'companyRegistrationConfig.companyProfile.contactAdmin.firstName=xcvxcv&companyRegistrationConfig.companyProfile.contactAdmin.lastName=xcvxcv&companyRegistrationConfig.companyProfile.contactAdmin.emailId=zkssd$numsaxigamsdjjjgfhgfjjjjhgqweqweqwejjjj%40foi.com&companyRegistrationConfig.companyProfile.userAddress.phone=123123123&companyRegistrationConfig.companyProfile.company.companyName=yoyoyoyoyo&mailingaddress1=123123123&mailingaddress2=&companyRegistrationConfig.companyProfile.companyMailingAddress.phone=123123123123&companyRegistrationConfig.companyProfile.companyMailingAddress.country.countryCode=US&companyRegistrationConfig.companyProfile.companyMailingAddress.state.stateCode=AK&companyRegistrationConfig.companyProfile.companyMailingAddress.otherState=&companyRegistrationConfig.companyProfile.companyMailingAddress.city=pune&companyRegistrationConfig.companyProfile.companyMailingAddress.zipCode=123&billingCheck=true&__checkbox_billingCheck=true&billingaddress1=123123123&billingaddress2=&companyRegistrationConfig.companyProfile.companyBillingAddress.phone=123123123123&companyRegistrationConfig.companyProfile.companyBillingAddress.country.countryCode=US&companyRegistrationConfig.companyProfile.companyBillingAddress.state.stateCode=AK&companyRegistrationConfig.companyProfile.companyBillingAddress.otherState=&companyRegistrationConfig.companyProfile.companyBillingAddress.city=pune&companyRegistrationConfig.companyProfile.companyBillingAddress.zipCode=123&companyRegistrationConfig.companyProfile.company.timeZone=JCP_TIMEZONE_00050&captchaText=$captcha&i_agree=true&__checkbox_i_agree=true&packet=EB2D3BDB8807DA3EEFEE221F12D1841DE8D91926CE5C9C3ACD42B9FD9B57B7CC26C3132FE31125BFCC84B7549C0D91A4' --compressed --insecure > result.html
 }         


	
	curl --cookie-jar ./cookie 'https://uat-snapp-store.avaya.com/jsdn/register/cmsSelfRegister.action?fromSelfRegistration=true' --insecure
	
	cap
	register

	
	
	
	x=$(cat result.html | grep 'Thanks for registering with us!!!' | wc -l)
	echo "checking if its successfull"
	echo $x
	




	if [[ "$x" -eq 1 ]]; then
		echo "successss"
	else
		echo "captcha issue breaking and capturing again"
		cap
		register
	fi

done