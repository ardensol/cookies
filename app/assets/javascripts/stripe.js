// Inspired by https://stripe.com/docs/stripe.js

mapCC = function(ccType){
  if(ccType == 'MasterCard'){
    return 'mastercard';
  } else if(ccType == 'Visa'){
    return 'visa';
  } else if(ccType == 'American Express'){
    return 'amex';
  } else if(ccType == 'Discover'){
    return 'discover';
  } else if(ccType == 'Diners Club'){
    return 'dinersclub';
  } else if(ccType == 'JCB'){
    return 'jcb';
  }
}

$(document).ready(function(){
  // For errors that happen later.
  stripePaymentMethod.prepend("<div id='stripeError' class='errorExplanation' style='display:none'></div>");

  $('.continue').on('click', function(){
    $('#stripeError').hide();
    if(stripePaymentMethod.is(':visible')){
      params = {
          number: $('.cardNumber:visible').val(),
          cvc: $('.cardCode:visible').val(),
          exp_month: $('.cardExpiryMonth:visible').val(),
          exp_year: $('.cardExpiryYear:visible').val()
        };

      Stripe.card.createToken(params, stripeResponseHandler);
      return false;
    }
  });
});

stripeResponseHandler = function(status, response){
  if(response.error){
    $('#stripeError').html(response.error.message);
    $('#stripeError').show();
  } else {
    stripePaymentMethod.find('#card_number, #card_expiry_month, #card_expiry_year, #card_code').prop("disabled" , true);
    stripePaymentMethod.find(".ccType").prop("disabled", false);
    stripePaymentMethod.find(".ccType").val(mapCC(response.card.type))
    token = response['id'];
    // insert the token into the form so it gets submitted to the server
    stripePaymentMethod.append("<input type='hidden' class='stripeToken' name='appointment[card_token]' value='" + token + "'/>");
    stripePaymentMethod.parents("form").get(0).submit();
  }
}

