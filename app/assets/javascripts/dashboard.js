(function() {

  var attachEventListeners = function() {
    var receiverId;
    var amount;
    var kudosModal = $('#kudosModal');
    var form = $('#kudos-transaction-form');

    var closeModal = function() {
      kudosModal.modal('hide');
    };

    kudosModal.on('hide.bs.modal', function(event) {
      $('.modal-error-message').html('');
      $('.kudo-transaction-reason').val('');
    });

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
      e.preventDefault();
      $('#kudos-to_id-input').val(receiverId);
      $('#kudos-transaction-form').submit();
    });

    form.on('ajax:success', function(event, data, status, jqXHR) {
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
      closeModal();
    });

    form.on('ajax:error', function(event, data, status, error) {
      var errorMessages = [];
      if (data.responseJSON) {
        Object.keys(data.responseJSON).forEach(function(errorKey) {
          var errorPredicate = data.responseJSON[errorKey];
          errorMessages.push(errorKey.charAt(0).toUpperCase() + errorKey.slice(1) + " " + errorPredicate);
        });
      } else {
        errorMessages.push("An unknown error occurred.  Please wait and try again.");
      }
      $('.modal-error-message').html("<h1>Uh no!</h1>" + errorMessages.join("<br/>"));
    });
  };
 
  $(document).on('turbolinks:load', attachEventListeners);
})();
