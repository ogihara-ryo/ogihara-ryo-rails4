module ApplicationHelper
  def page_title(title)
    if title.empty?
      OgiharaRyo::Application.config.title
    else
      "#{title} | #{OgiharaRyo::Application.config.title}"
    end
  end

  def link_to_blog_category(blog_category, admin: false)
    return '' if blog_category.blank?
    # TODO: 一時的に管理者ページへ飛ばす
    link_to blog_category.name, [admin ? :admin : :admin, blog_category]
  end

  def accounts
    [
      link_to('GitHub', 'https://github.com/ogihara-ryo', target: '_blank'),
      link_to('Bitbucket', 'https://bitbucket.org/ogihara-ryo/', target: '_blank'),
      link_to('Twitter', 'https://twitter.com/OgiharaRyo', target: '_blank'),
      link_to('Facebook', 'https://www.facebook.com/ryo.ogihara.5', target: '_blank')
    ].join(', ').html_safe
  end
end
