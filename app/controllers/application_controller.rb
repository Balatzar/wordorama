class ApplicationController < ActionController::Base
  before_action :set_translations, only: :index

  private

  def set_translations
    return unless params[:word].present?
    translation = Translation.find_by! word: params[:word]
    @translations = translation.result
  rescue ActiveRecord::RecordNotFound
    @translations = []
    EasyTranslate::LANGUAGES.each do |lang|
      @translations << [lang[1], EasyTranslate.translate(params[:word], to: lang[0])]
    end
    Translation.create! word: params[:word], result: @translations
  end
end
