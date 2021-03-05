let a = {
  product: {
    id: 1000000001,
    title: 'Product title',
    body_html: '<strong>Product Body HTML</strong>',
    vendor: 'Product Vendor',
    product_type: 'Product Type',
    created_at: '2020-02-06T12:40:15-05:00',
    handle: 'product-handle',
    updated_at: '2020-02-06T12:40:16-05:00',
    published_at: '2020-02-06T12:40:15-05:00',
    template_suffix: null,
    published_scope: 'web',
    tags: 'tag1,tag2,tag3',
    admin_graphql_api_id: 'gid://shopify/Product/0000000001',
    variants: [
      {
        id: 1000000002,
        product_id: 1000000001,
        title: 'Variant Title',
        price: '1.00',
        sku: 'Variant-SKU-1',
        position: 1,
        inventory_policy: 'deny',
        compare_at_price: null,
        fulfillment_service: 'manual',
        inventory_management: null,
        option1: 'Default Title',
        option2: null,
        option3: null,
        created_at: '2020-02-06T12:40:16-05:00',
        updated_at: '2020-02-06T12:40:16-05:00',
        taxable: true,
        barcode: null,
        grams: 0,
        image_id: null,
        weight: 0.0,
        weight_unit: 'lb',
        inventory_item_id: 1000000003,
        inventory_quantity: 0,
        old_inventory_quantity: 0,
        requires_shipping: true,
        admin_graphql_api_id: 'gid://shopify/ProductVariant/000000002',
        presentment_prices: [
          {
            price: {
              currency_code: 'USD',
              amount: '1.00',
            },
            compare_at_price: null,
          },
        ],
      },
    ],
    options: [
      {
        id: 1022828602,
        product_id: 1000000001,
        name: 'Title',
        position: 1,
        values: ['Default Title'],
      },
    ],
    images: [],
    image: null,
  },
};

let b = {
  code: '1000000001',
  active: true,
  bodyHtml: '<strong>Product Body HTML</strong>',
  vendor: 'Product Vendor',
  images: [
    { source: 'https://url.com/0', position: 0 },
    { source: 'https://url.com/1', position: 1 },
  ],
  title: 'Product title',
  variants: [
    {
      id: '1000000002',
      title: 'Variant Title',
      inventory_quantity: 0,
      sku: 'Variant-SKU-1',
      option1: 'Default Title',
      option2: null,
      option3: null,
      barcode: null,
    },
  ],
  options: [
    {
      name: 'Title',
      type: 'select',
      position: 0,
    },
  ],
};

let c = a.stringify;
let d = b.stringify;
