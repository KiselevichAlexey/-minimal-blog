<div class="sidebar-box">
    <div class="bio text-center">
        <img alt="Image Placeholder" src="<?= MARKUP_PATH ?>images/person_1.jpg" class="img-fluid">
        <div class="bio-body">
            <h2>Meagan Smith</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt
                repellendus
                excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>
            <p><a href="/about" class="btn btn-primary btn-sm">Read my bio</a></p>
            <?php $APPLICATION->IncludeComponent(
                "project:social",
                "sidebar",
                [
                    "CACHE_TIME" => "3600",
                    "CACHE_TYPE" => "A",
                    "COMPONENT_TEMPLATE" => "sidebar",
                ]
            ); ?>
        </div>
    </div>
</div>