class PagamentoController < ApplicationController

def finalizar
  
  
  if session["PERFIL_USUARIO"].nil?
    
    format.html { redirect_to :controller => "login", :action => "login" }
    
  else
  
  
  
  @pagamento = Pagamento.new
  @pedido_usuario = Pedido.find_by_id(session["ID_PEDIDO"])

end


def finalizarpedido
    
  
    @pagamento = Pagamento.create(pagamento_params)
    @pagamento.instituicao = 'ITAU'
  
  
      if @pagamento.valid?
    
      @pagamento.save
      flash[:notice] = 'Pagamento realizado com sucesso. Clique em voltar'
      
      
      format.html { redirect_to :controller => "login", :action => "login" }
    
      else
    
    
      flash[:notice] = @usuario.errors.values.join("<br/>").html_safe
    
  
    
    end
  end

end



private

  def pagamento_params
    params.require(:pagamento).permit(:forma_pagamento,
 
:data_vencimento,
:forma_pagamento,
:agencia,
:conta,
:bandeira,
:instituicao

)
  end




end
