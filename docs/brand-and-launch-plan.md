# MedStudy Gear — Launch Plan

## Niche
Premium back-to-school / study essentials for healthcare learners: medical students, nursing students, residents, physician assistants, pharmacy students, dental students, and allied health learners.

## Guardrails
- Neutral, professional, study-focused.
- No politics, no religion, no sexual/culture-war messaging, no positive or negative positioning around protected identity topics.
- Avoid explicit medical claims or advice.
- Avoid copyrighted university/hospital names, logos, crests, specialty board names, or trademarked exam names unless used descriptively and safely.

## Brand
- Name: MedStudy Gear
- Tagline: Built for long study days.
- Tone: calm, focused, premium, practical.
- Visual style: deep navy, cream, mint accent, editorial typography, minimal medical/study motifs.

## First collection: Long Study Days
1. Hydration Rounds — stainless steel water bottle
2. Differential Diagnosis Mode — oversized tee
3. Built for Long Study Days — laptop sleeve
4. One More Chapter — raglan shirt
5. Call Room Calm — tote/laptop accessory pattern
6. Notes Before Rounds — notebook/stationery design
7. Focus. Review. Repeat. — minimalist shirt/accessory design
8. Study Shift — all-over repeating pattern for sleeves/bags

## Pricing target
- Shirts: CAD $34–42
- Oversized tee: CAD $42–52
- Water bottle: CAD $32–40
- Laptop sleeve: CAD $36–48
- Tote: CAD $26–34
- Notebook/stationery if available: CAD $18–28

## Launch sequence
1. Deploy WooCommerce shell at `medstudy.rainomotion.com`.
2. Rabiaa connects Printful account through the Printful plugin.
3. Add first 5–8 products in Printful using exported PNG print files.
4. Sync products to WooCommerce.
5. Configure Stripe/PayPal in WooCommerce; Rabiaa completes KYC.
6. Test checkout with one low-cost product/sample order.
7. Publish homepage/shop and start social/SEO content.

## Printful/WooCommerce requirements from Printful guide
- Install Printful WooCommerce plugin.
- Use non-Plain permalinks; configured to Post name.
- WooCommerce API must work; because WooCommerce 9+ moved legacy API out of core, the deployment includes `woocommerce-legacy-rest-api`.
- Enable Printful shipping in WooCommerce settings after connection.
- Printful billing method must be added in Printful dashboard before orders can fulfill.
