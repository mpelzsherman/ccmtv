class PerformanceDecorator < ApplicationDecorator
  decorates :performance

  def full_title
    performer = model.performer.nil? ? 'Unknown' : model.performer.canonical_name
    "#{performer} performs #{model.composer.canonical_name}'s #{model.composition.title}"
  end

  def url_link
    h.link_to 'link',  model.url.http, :target => '_blank', :title => model.url.http
  end

  def type_name
    h.content_tag(:span, :class => "label label-#{label_type}") do
      model.performance_type.name
    end
  end

  def performer_link
    return '' unless model.performer
    h.link_to model.performer.canonical_name, h.person_path(model.performer)
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

  def perf_date
    model.perf_date.nil? ? 'unknown date' : model.perf_date
  end

  def composition_link
    h.link_to(model.composition.title, h.composition_path(model.composition)) +
        ' by ' +
    h.link_to(model.composition.composer.canonical_name, h.person_path(model.composition.composer))
  end

  def performance_link
    performer_name = model.performer ? model.performer.canonical_name : 'unknown'
    h.link_to("by #{performer_name}, on #{perf_date}", h.performance_path(model))
  end
end
