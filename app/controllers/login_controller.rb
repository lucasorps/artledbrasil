class LoginController < ApplicationController

    
before_filter :verificaracesso, except: [:login, :autenticar, :logout]  




def login
  
  @desabilitar_pesquisa = true
  @desabilitar_menuacoes = true


  
end





def autenticar

    

    login = params[:email] #name do campo <input>
    senha = params[:senha] #name do campo <input>
    
   if login.nil? || senha.nil? #Se o objeto está null
      
      redirect_to :action => "login"
      flash[:notice] = "Dados obrigatorios para o login nao foram informados"
      
    else

    @usuario = Usuario.find( :first, 
    :conditions => [ "email=? and senha=?", login, senha ] ) 
      #Se nenhum registro for encontrado, o retorno é null
      
      if @usuario.nil? #Se o objeto está null
        
        redirect_to :action => "login"
        flash[:notice] = "O e-mail ou a senha sao Invalidos. Por favor, corrija os dados e tente novamente."
        
      else
           
            
      #Criar uma Sessão para armazenar o login do usuario autenticado
      session["ID_USUARIO"] = @usuario.id
      session["NOME_USUARIO"] = @usuario.nome
      session["PERFIL_USUARIO"] = @usuario.perfil
      redirect_to :controller => "home", :action => "index"
      
      end
    end
    
  
end

def logout

   
    #Destruir a sessão
   session["ID_USUARIO"] = nil
   session["NOME_USUARIO"] = nil
   session["PERFIL_USUARIO"] = nil
    #Redirecionar para a página de login
    redirect_to :action => "login"

end

end