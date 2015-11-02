## DB Tables

#### community<br/>
	- community_id
	- community_name
	- community_pic_url
	- community_moderator_id [ user_id ]
	- community_type (public/private)

#### user<br/>
	- user_id
	- user_full_name
	- user_email
	- login_type(FB/TW/GOO)
	- tagline
	- profile_pic_url

#### posts<br/>
	- post_id
	- post_title
	- post_url
	- post_community_id [ community_id ]
	- post_media_url
	- post_text
	- post_author [ user_id ]
	- post_reference_url
	- post_type(quote/audio/video/photo)
	- post_status
	- post_created_on
	- is_private
	- num_minutes_read
	- offensive_flag_count

#### comments<br/>
	- comment_id
	- reply_to_comment_id
	- post_id
	- comment_user_id [ user_id ]
	- comment_text
	- commented_on
	- offensive_flag_count

#### likes<br/>
	- like_id
	- user_id
	- post_id
	- liked_on

#### tags<br/>
	- tag_id
	- tag_name
	- tag_rank

#### posts_tags<br/>
	- posts_tag_id
	- tag_id
	- post_id

#### followers<br/>
	- follower_id
	- user_id
	- following_user_id

#### community_followers<br/>
	- community_follower_id
	- user_id
	- following_community_id

#### saved_posts<br/>
	- saved_post_id
	- post_id
	- user_id
	- saved_on
	- status(read/unread)

#### favorite_posts<br/>
	- favorite_post_id
	- user_id
	- post_id

#### popular_posts<br/>
	- popularity_id
	- post_id
	- num_likes
	- num_reads
	- num_comments
	- num_marked_offensive
