<template>
  <div
    class="activation-page"
    style="font-family: var(--font-nunito); background-color: var(--color-off-white); color: var(--color-body); padding: 3rem 2rem;"
  >
    <!-- Heading Section -->
    <header
      class="activation-header"
      style="text-align: center; margin-bottom: 3rem;"
    >
      <h1
        style="font-family: var(--font-quicksand); font-size: 28px; color: var(--color-secondary); margin-bottom: 1rem; font-weight: 600;"
      >
        Choose Your Plan &amp; Activate Your Account
      </h1>
      <p
        style="font-size: 16px; line-height: 1.6; max-width: 700px; margin: 0 auto; color: var(--color-body);"
      >
        Welcome to our platform! Select one of our flexible subscription plans
        below. Once you sign up, you’ll be able to access an Admin account, add
        Employees, and invite Customers to your dedicated portal.
      </p>
      <img
        src="/images/pricing.png"
        alt="Activation Banner"
        style="width: 100%; max-width: 900px; margin-top: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);"
      />
    </header>

    <!-- Activation Steps Section -->
    <section
      class="activation-steps"
      style="margin-bottom: 3rem; text-align: center;"
    >
      <h2
        style="font-family: var(--font-quicksand); font-size: 22px; color: var(--color-secondary); margin-bottom: 1rem; font-weight: 600;"
      >
        How Activation Works
      </h2>
      <ol
        style="max-width: 800px; margin: 0 auto 2rem; text-align: left; padding-left: 2rem; font-size: 16px; line-height: 1.6; color: var(--color-body);"
      >
        <li style="margin-bottom: 1rem;">
          <strong>Select a Plan:</strong> Pick the subscription that best fits your
          needs.
        </li>
        <li style="margin-bottom: 1rem;">
          <strong>Sign Up as Admin:</strong> Provide your details to create an Admin
          account.
        </li>
        <li style="margin-bottom: 1rem;">
          <strong>Add Employees &amp; Customers:</strong> Invite team members and
          customers via email.
        </li>
        <li style="margin-bottom: 1rem;">
          <strong>Grant Access:</strong> Employees and Customers each get their own
          portal for tasks or inquiries.
        </li>
        <li style="margin-bottom: 1rem;">
          <strong>Manage &amp; Monitor:</strong> Enjoy real-time dashboards,
          streamlined workflows, and easy collaboration.
        </li>
      </ol>
      <img
        src="/images/sign-up-account.png"
        alt="Activation Steps"
        style="width: 100%; max-width: 900px; margin: 2rem auto; display: block; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); border: 1px solid #0B1460;"
      />
      <p
        style="font-size: 16px; line-height: 1.6; max-width: 800px; margin: 0 auto; color: var(--color-body);"
      >
        Once your Admin account is active, you can manage everything from a central
        dashboard. Monitor production, track orders, assign tasks to Employees, and
        offer Customers an easy way to stay updated on their inquiries. Our platform
        ensures smooth collaboration.
      </p>
    </section>

    <!-- CTA Text Section -->
    <section
      class="activation-cta"
      style="text-align: center; margin-bottom: 3rem;"
    >
      <h2
        style="font-family: var(--font-quicksand); font-size: 22px; color: var(--color-secondary); margin-bottom: 1rem; font-weight: 600;"
      >
        Ready to Get Started?
      </h2>
      <p
        style="font-size: 16px; line-height: 1.6; max-width: 800px; margin: 0 auto; color: var(--color-body);"
      >
        Create your Admin account now and take control of your entire workflow.
        Whether you’re a small team or a growing enterprise, our platform scales with
        your business. Activate your plan and enjoy seamless management and
        collaboration.
      </p>
    </section>
  </div>
</template>

<style scoped>
:root {
  /* Font Families */
  --font-quicksand: 'Quicksand', sans-serif; /* Headings */
  --font-nunito-sans: 'Nunito Sans', sans-serif; /* Subheadings */
  --font-nunito: 'Nunito', sans-serif; /* Normal text */

  /* Colours */
  --color-primary: #2667FF;
  --color-secondary: #0B1460;
  --color-tertiary: #6EF1B2;
  --color-body: #5C6185;
  --color-white: #fafafa;
  --color-black: #000000;
  --color-off-white: #F6F9FB;
  --color-primary-5: rgb(175, 199, 255);
  --color-primary-7: rgba(38, 103, 255, 0.07);
  --color-primary-10: rgba(38, 103, 255, 0.1);
  --color-secondary-10: rgba(11, 20, 96, 0.1);
  --color-white-10: rgba(255, 255, 255, 0.1);
  --color-white-60: rgba(255, 255, 255, 0.6);
  --color-white-70: rgba(255, 255, 255, 0.7);
  --color-dark: #151516;
  --color-deep-dark: #0B0B0B;
}

@media (max-width: 768px) {
  .activation-page {
    padding: 2rem 1rem;
  }
  h1 {
    font-size: 24px !important;
  }
  h2 {
    font-size: 20px !important;
  }
  p, ol {
    font-size: 14px !important;
  }
  img {
    max-width: 100% !important;
  }
}
</style>
