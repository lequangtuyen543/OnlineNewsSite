<?php

        require_once (BASE_PATH . '/template/admin/layouts/head-tag.php')

?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h5"><i class="fas fa-newspaper"></i> Bài viết</h1>
    <div class="btn-toolbar mb-2 mb-md-0">
        <a role="button" href="<?= url('admin/post/create') ?>" class="btn btn-sm btn-success">Tạo bài viết</a>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <caption>Danh sách bài viết</caption>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Tiêu đề</th>
                    <th>Tóm tắt</th>
                    <th>Lượt xem</th>
                    <th>status</th>
                    <th>user ID</th>
                    <th>cat ID</th>
                    <th>Ảnh</th>
                    <th>Tùy chỉnh</th>
                </tr>
            </thead>
            <tbody>

            <?php foreach ($posts as $key => $post) { ?>
              
                <tr>
                    <td>
                        <?= $key += 1 ?>
                    </td>
                    <td>
                        <?= $post['title'] ?>
                    <td>
                        <?= $post['summary'] ?>
                    </td>
                    <td>
                        <?= $post['view'] ?>
                    </td>
                    <td>
                        <?php if($post['breaking_news'] == 2) { ?>
                            <span class="badge badge-success">#breaking_news</span>
                        <?php }
                        if($post['selected'] == 2) { ?>
                            <span class="badge badge-dark">#editor_selected</span>
                        <?php } ?>
                    </td>
                    <td>
                        <?= $post['user_id'] ?>
                    </td>
                    <td>
                        <?= $post['cat_id'] ?>
                    </td>
                    <td>
                            <img style="width: 80px;" src="<?= asset($post['image']) ?>" alt="">
                     </td>
                <td style="width: 25rem;">
                    <a role="button" class="btn btn-sm btn-warning btn-info text-dark" href="<?= url('admin/post/breaking-news/' . $post['id']) ?>">
                        <?php if($post['breaking_news'] == 2) { ?>
                   Xóa tin tức nổi bật
                   <?php } else { ?>
                   Thêm tin tức nổi bật
                   <?php } ?>
                        </a>
                        <a role="button" class="btn btn-sm btn-warning btn-warning text-dark" href="<?= url('admin/post/selected/' . $post['id']) ?>">
                        <?php if($post['selected'] == 2) { ?>
                   Xóa tin đã chọn
                   <?php } else { ?>
                     Thêm tin đã chọn
                    <?php } ?>
                        </a>
                        <hr class="my-1" />
                        <a role="button" class="btn btn-sm btn-primary text-white" href="<?= url('admin/post/edit/' . $post['id']) ?>">Cập nhật</a>
                <a role="button" class="btn btn-sm btn-danger text-white" href="<?= url('admin/post/delete/' . $post['id']) ?>">Xóa</a>
                </td>
                </tr>

                <?php } ?>
                </tbody>

                </table>
        </div>



<?php

require_once (BASE_PATH . '/template/admin/layouts/footer.php')

?>