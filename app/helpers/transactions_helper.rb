module TransactionsHelper

  def recent_transactions_widget_for(curr_account)
    content_tag :table, class: "transactions" do
      "<thead><th>Description</th><th>Amount</th><th></th></thead><tbody>".html_safe <<
      curr_account.recent_transactions(limit: current_user.number_of_transactions_per_account).collect {|curr_transaction|
        content_tag :tr, class: "transaction" do
          ("<td class='transaction_field transaction_description'>#{curr_transaction.description}</td>" <<
          "<td class='transaction_field transaction_amount'>#{number_to_currency(curr_transaction.amount)}</td>" <<
          "<td class='transaction_field transaction_edit'>#{link_to 'Edit', edit_account_transaction_path(curr_account, curr_transaction)}</td>").html_safe
        end
      }.join("\n").html_safe
    end
  end
end