## DB Tables

#### community<br/>
	- community_id<br/>
	- community_name<br/>
	- community_pic_url<br/>
	- community_moderator_id [ user_id ]<br/>
	- community_type (public/private)<br/>

#### user<br/>
	- user_id<br/>
	- user_full_name<br/>
	- user_email<br/>
	- login_type(FB/TW/GOO)<br/>
	- tagline<br/>
	- profile_pic_url<br/>

#### posts<br/>
	- post_id<br/>
	- post_title<br/>
	- post_url<br/>
	- post_community_id [ community_id ]<br/>
	- post_media_url<br/>
	- post_text<br/>
	- post_author [ user_id ]<br/>
	- post_reference_url<br/>
	- post_type(quote/audio/video/photo)<br/>
	- post_status<br/>
	- post_created_on<br/>
	- is_private<br/>
	- num_minutes_read<br/>
	- offensive_flag_count<br/>

#### comments<br/>
	- comment_id<br/>
	- reply_to_comment_id<br/>
	- post_id<br/>
	- comment_user_id [ user_id ]<br/>
	- comment_text<br/>
	- commented_on<br/>
	- offensive_flag_count<br/>

#### likes<br/>
	- like_id<br/>
	- user_id<br/>
	- post_id<br/>
	- liked_on<br/>

#### tags<br/>
	- tag_id<br/>
	- tag_name<br/>
	- tag_rank<br/>

#### posts_tags<br/>
	- posts_tag_id<br/>
	- tag_id<br/>
	- post_id<br/>

#### followers<br/>
	- follower_id<br/>
	- user_id<br/>
	- following_user_id<br/>

#### community_followers<br/>
	- community_follower_id<br/>
	- user_id<br/>
	- following_community_id<br/>

#### saved_posts<br/>
	- saved_post_id<br/>
	- post_id<br/>
	- user_id<br/>
	- saved_on<br/>
	- status(read/unread)<br/>

#### favorite_posts<br/>
	- favorite_post_id<br/>
	- user_id<br/>
	- post_id<br/>

#### popular_posts<br/>
	- popularity_id<br/>
	- post_id<br/>
	- num_likes<br/>
	- num_reads<br/>
	- num_comments<br/>
	- num_marked_offensive<br/>
