class AccountPresenter < DelegatePresenter::Base

  def name_and_info
    s(self.name, "<span class='balance'>: $#{self.current_balance}</span>")
  end
end
