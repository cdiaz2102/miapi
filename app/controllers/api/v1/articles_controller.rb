

module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded articles', data:articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'SUCCESS', message:'Cargo un Articulo', data:article}, status: :ok
      end

      def create
        article = Article.new(article_params)

        if article.save
          render json:{status:"SUCCESS", message: "Saved article", data:article}, status: :ok
        else
          render json:{status:"ERROR", message: "Article not saved", data:article.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json:{status:"SUCCESS", message: "BOOM! Voló!!", data:article}, status: :ok
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json:{status:"SUCCESS", message: "Updated Article", data:article}, status: :ok
        else
          render json:{status:"ERROR", message: "Articulo no actualizado", data:article.errors}, status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :content)
      end

    end
  end
end
