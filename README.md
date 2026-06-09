# MedStudy Gear

Print-on-demand WooCommerce + Printful launch package.

Niche: premium study essentials for medical students, nursing students, residents, and healthcare learners.
Positioning: neutral/professional/student lifestyle only. No political, religious, or culture-war positioning.

Public domain target: `https://medstudy.rainomotion.com`
Stack: WordPress + WooCommerce + Printful WooCommerce plugin + WooCommerce Legacy REST API extension, deployable on Coolify.

## Current status
- WooCommerce deployment package prepared.
- Brand/product blueprint prepared.
- Print-ready launch design files generated under `designs/png/`.
- Rabiaa still needs to connect Printful account and complete payment/KYC/billing.

## Printful connection checklist
1. Open WordPress admin: `/wp-admin`.
2. Confirm plugins active: WooCommerce, Printful Integration for WooCommerce, WooCommerce Legacy REST API.
3. Settings → Permalinks → Post name.
4. WooCommerce → Settings → Advanced / Legacy REST API: enabled via extension.
5. Printful plugin → Connect → approve WooCommerce access.
6. Printful dashboard → connect store → set billing method.
7. Printful dashboard → add products using the print files in `designs/png/`.
8. Enable Printful shipping in WooCommerce → Settings → Shipping → Printful Shipping.
