class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 
 
 #protect_from_forgery with: :exception
 #include LoginHelper
 
  
  #'verificarusuario' é um método que deverá ser chamado antes
  #que uma página ou controle seja acessado
  #before_filter :verificaracesso, except: [:retornapesquisa]  
  
  #def verificaracesso
    
    #Checar se um usuário não está em sessão
    #secure? -> espera que o secure esteja true (acesso restrito)
    #session["USUARIO"].nil? -> espera que a sessão esteja null
    
   # if session["USUARIO"].nil? #nil -> null
     # redirect_to :controller => "login", :action => "login"
    #end
    
  #end  
    
  #Método para verificar se um usuario poderá
  #acessar algum nivel protegido da aplicação
 
  
   def pesquisartodosprodutos
    
      
   if session["PERFIL_USUARIO"].nil? || session["PERFIL_USUARIO"] == 'CLI'
   
      @produtos = Produto.where("visivel=true").order(:destaque)
    else
      @produtos = Produto.all
    end 
    
     dados = "<div class='features_items'><h2 class='title text-center'>Produtos</h2>"
    
     for p in @produtos
    
    
    dados += "<div class='col-sm-4'>"    
    dados +=           "<div class='product-image-wrapper'>"
    dados +=             "<div class='single-products'>"    
    dados +=               "<div class='productinfo text-center'>"
    dados +=                 view_context.image_tag(p.imagem.url, size: "60x100") 
    dados +=                 "<h2> R$ " + "%.02f" % p.preco_unitario + "</h2>"
    dados +=                 "<p>" + (view_context.link_to p.nome, {:controller => 'produto', :action => 'detalhar', :id => p.id} ) + "</p>"
    dados +=                 (view_context.link_to '<i class="fa fa-shopping-cart"></i>Adicionar ao Carrinho'.html_safe, {:controller => 'pedido', :action => 'incluirprodutocarrinho', :id => p.id, :quantidade => 1}, class: 'btn btn-default add-to-cart' )
    dados +=              "</div>"      
    dados +=  "</div>"
    dados += "<div class='choose'>"
    dados += "<ul class='nav nav-pills nav-justified'>"
    puts session["PERFIL_USUARIO"]
    if session["PERFIL_USUARIO"] == "FUN" || session["PERFIL_USUARIO"] == "ADM"
      dados += "<li>" + (view_context.link_to '<i class="fa fa-plus-square"></i>Editar'.html_safe, {:controller => 'produto', :action => 'edicao', :id => p.id})   + "</li>"          
      dados += "<li>" + (view_context.link_to '<i class="fa fa-plus-square"></i>Excluir'.html_safe, {:controller => 'produto', :action => 'excluir', :id => p.id} ) + "</li>"
    end
    dados += "</ul>"
    dados += "</div>"
    dados += "</div>"
    dados += "</div>" 
 
    
       
 

     end 
   
   
  dados += "</div>"
  dados += "</div>"
    
   render :text => dados 
    
  end

  






 
  
 def retornapesquisa
    
    
    if session["PERFIL_USUARIO"].nil? || session["PERFIL_USUARIO"] == 'CLI'
      #Se o usuário nao estiver logado ou for do tipo cliente, não exibir os produtos nao marcados como visivel 
      @produtos = Produto.where("nome like ? and visivel=true", params[:produto] + '%')
    else
      @produtos = Produto.where("nome like ?", params[:produto] + '%')
    end 
    
    dados = "<div class='features_items'><h2 class='title text-center'>Produtos</h2>"
              
    
    
     for p in @produtos
    
    
    dados += "<div class='col-sm-4'>"    
    dados +=           "<div class='product-image-wrapper'>"
    dados +=             "<div class='single-products'>"    
    dados +=               "<div class='productinfo text-center'>"
    dados +=                 view_context.image_tag(p.imagem.url, size: "60x100") 
    dados +=                 "<h2> R$ " + "%.02f" % p.preco_unitario + "</h2>"
    dados +=                 "<p>" + (view_context.link_to p.nome, {:controller => 'produto', :action => 'detalhar', :id => p.id} ) + "</p>"
    dados +=                (view_context.link_to '<i class="fa fa-shopping-cart"></i>Adicionar ao Carrinho'.html_safe, {:controller => 'pedido', :action => 'incluirprodutocarrinho', :id => p.id, :quantidade => 1}, class: 'btn btn-default add-to-cart' )
    dados +=              "</div></div>"      
    dados += "<div class='choose'>"
    dados += "<ul class='nav nav-pills nav-justified'>"
    puts session["PERFIL_USUARIO"]
    if session["PERFIL_USUARIO"] == "FUN" || session["PERFIL_USUARIO"] == "ADM"
      dados += "<li>" + (view_context.link_to '<i class="fa fa-plus-square"></i>Editar'.html_safe, {:controller => 'produto', :action => 'edicao', :id => p.id})   + "</li>"          
      dados += "<li>" + (view_context.link_to '<i class="fa fa-plus-square"></i>Excluir'.html_safe, {:controller => 'produto', :action => 'excluir', :id => p.id} ) + "</li>"
    end
    dados += "</ul></div></div></div>" 
  
 
    
       
 

     end 
   
   
  dados += "</div>"
  
    
   render :text => dados 
    
  end

  

end
