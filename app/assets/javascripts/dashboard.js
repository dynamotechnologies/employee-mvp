(function() {

  var attachEventListeners = function() {
    var receiverId;
    var amount;
    var kudosModal = $('#kudosModal');
    kudosModal.on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var firstName = button.data('employee-first-name');
      receiverId = button.data('employee-id');
      amount = button.data('kudos-amount');

      $('.kudo-receiver-name').html(firstName);

      var unit = (amount == '1') ? ' kudo' : ' kudos';
      $('.kudo-amount').html(amount + unit);
    });

    $('.give-btn').click(function(e) {
      $.ajax({
        type: 'POST',
        url: '/kudos',
        dataType: 'json',
        data: {
          kudo_transaction: {
            to_id: receiverId,
            amount: amount
          }
        },
      }).done(function(data){
        var balanceField = $('*[data-kudo-balance-id="' + data.from_id +'"]');
        var receivedField = $('*[data-kudo-received-id="' + data.to_id +'"]');

        var balance = parseInt(balanceField.html());
        balance -= data.amount;

        var received = parseInt(receivedField.html());
        received += data.amount;

        if (isNaN(balance)) {
          balance = "Unknown";
        }
        if (isNaN(received)) {
          received = "Unknown";
        }

        balanceField.html(balance);
        receivedField.html(received);
        kudosModal.modal('hide');
      });
    });
  };
 
  $(document).on('turbolinks:load', attachEventListeners);
})();
