class PerformanceDecorator < ApplicationDecorator
  decorates :performance

  def full_title
    model.person.canonical_name +  ' performs ' + model.composition.composer.canonical_name + "'s " + model.composition.title
  end


  def url_link
    h.link_to 'link',  model.url.http, :target => '_blank', :title => model.url.http
  end

  def type_name
    h.content_tag(:span, :class => "label label-#{label_type}") do
      model.performance_type.name
    end
  end

  def label_type
    case model.performance_type.name
    when 'video' then 'info'
    when 'videoscore' then 'success'
    when 'audio' then 'warning'
    when 'audioscore' then 'inverse'
    else ''
    end
  end
end
