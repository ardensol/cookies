var preAdjustmentTotal = $('#apartment option:selected').val();

    $('#appointment_appointment_type').change(function() {
      calculate()
    });

    $('.radio-buttons').change(function() {
      calculate()
    });

    $('.extra-option').change(function() {
      calculate()
    });

    function calculate() {
      var appointment_type = $('#appointment_appointment_type option:selected').val();
      var frequency = $('.radio-buttons :checked').val()

      if (frequency === 'onetime') {
        multiple = 1
      } else if (frequency === 'monthly') {
        multiple = 0.9
      } else if (frequency === 'biweekly') {
        multiple = 0.85
      } else if (frequency === 'weekly') {
        multiple = 0.8 };

      
      var deep_clean = $('#appointment_deep_clean').is(':checked') ? 25.00 : 0.00;

      var total = appointment_type + deep_clean

      var discounted_amount = total * multiple 
      var discounted_amount = Math.floor(discounted_amount*100)/100
      


      $('#var_total').val(discounted_amount);

      $(".payment-table").find("tr").remove();

      $("#finalprice").find("p").remove();

      
      $('<tr><td><p>Subtotal</p></td><td><p>$' + discounted_amount + '</p></tr><tr><td ><p><strong>Total</strong></p></td><td><p><strong>$' + discounted_amount +'</strong></p></td></tr>').appendTo('.payment-table');

      $('<p>Final Price: <strong>$' + discounted_amount + '</strong></p>').appendTo('#finalprice');

      };