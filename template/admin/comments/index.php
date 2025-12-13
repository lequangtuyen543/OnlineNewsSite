<?php

        require_once(BASE_PATH . '/template/admin/layouts/head-tag.php');


?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h5"><i class="fas fa-newspaper"></i> Bình luận</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <a role="button" href="#" class="btn btn-sm btn-success disabled">Tạo bình luận</a>
        </div>
    </div>
    <section class="table-responsive">
        <table class="table table-striped table-sm">
            <caption>Danh sách bình luận</caption>
            <thead>
                <tr>
                    <th>#</th>
                    <th>user ID</th>
                    <th>post ID</th>
                    <th>Bình luận</th>
                    <th>Trạng thái</th>
                    <th>Tùy chỉnh</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($comments as $key => $comment) { ?>
                <tr>
                    <td><a href=""><?= $key += 1 ?></a>
                </td>
                <td>
                <?= $comment['email'] ?>
                </td>
                <td>
                <?= $comment['post_title'] ?>
                </td>
                <td>
                <?= $comment['comment'] ?>
                </td>
                <td>
                <?= $comment['status'] ?>
                </td>
                <td>
                    <?php if ($comment['status'] == 'seen') { ?>
                    <a role="button" class="btn btn-sm btn-success text-white" href="<?= url('admin/comment/change-status/' . $comment['id']) ?>">Chấp nhận</a>
                    <?php } else { ?>
                    <a role="button" class="btn btn-sm btn-warning text-white" href="<?= url('admin/comment/change-status/' . $comment['id']) ?>">Không chấp nhận</a>
                    <?php } ?>
                </td>
                </tr>

                <?php } ?>
                </tbody>
                </table>
                </section>




<?php

require_once(BASE_PATH . '/template/admin/layouts/footer.php');


?>