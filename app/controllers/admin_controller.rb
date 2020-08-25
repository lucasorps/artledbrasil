class AdminController < ApplicationController

def comprar
  
  if session["USUARIO"] = nil?
    redirect_to :controller => "login", :action => "login"  
  else
    redirect_to :controller => "pedido", :action => "adicionarProdutoCarrinho", 
  end

end




def autenticar
    
    #Resgatar os campos enviados pelo formulário
    login = params[:login] #name do campo <input>
    senha = params[:senha] #name do campo <input>
    
     @usuario = Usuario.find( :first, 
:conditions => [ "login=? and senha=?", login, senha ] ) 
    #Se nenhum registro for encontrado, o retorno é null
    
    if @usuario.nil? #Se o objeto está null
      
      redirect_to :action => "login"
      flash[:notice] = "Acesso Negado. Tente Novamente."
      
    else
            
      #Criar uma Sessão para armazenar o login do usuario autenticado
      session["USUARIO"] = @usuario.nome
      redirect_to :controller => "admin", :action => "homepage"
      
    end
    
  end

end

