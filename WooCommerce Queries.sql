-- Query to fetch all the variations with parent sku

SELECT
    variations.ID AS variation_id,
    variations.post_title AS variation_name,
    variation_meta.meta_value AS variation_sku
FROM
    wp_posts AS parent_product
JOIN
    wp_postmeta AS parent_meta
    ON parent_product.ID = parent_meta.post_id
JOIN
    wp_posts AS variations
    ON parent_product.ID = variations.post_parent
JOIN
    wp_postmeta AS variation_meta
    ON variations.ID = variation_meta.post_id
WHERE
    parent_product.post_type = 'product'
    AND parent_product.post_status = 'publish'
    AND parent_meta.meta_key = '_sku'
    AND parent_meta.meta_value = '0946'
    AND variations.post_type = 'product_variation'
    AND variation_meta.meta_key = '_sku';
