module UsersHelper
  def profile_post(usr, post)
    render partial: 'posts/post_form', post: post if usr == current_user
  end

  def profile_owner(usr)
    render partial: 'users/user_profile', user: usr unless usr == current_user
  end

  def delete_post(post)
    render partial: 'components/delete_post_button', locals: { post: post } if current_user == post.author
  end

  def delete_post_comment(post, comment)
    render partial: 'components/delete_post_comment_button', locals: { post: post, comment: comment } if current_user == comment.author
  end

  def follow_unfollow(user)
    if !current_user.following.include?(user)
      render partial: 'components/follow_button', user: user
    else
      render partial: 'components/unfollow_button', user: user
    end
  end
end
