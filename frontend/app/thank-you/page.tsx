import Link from "next/link";

const highlights = [
  {
    title: "Launch is close",
    description:
      "We are putting the finishing touches on WealthIQ so you can build the confidence and habits that stick.",
  },
  {
    title: "Golden Hour access",
    description:
      "Your free 3-month membership unlocks guided morning routines, goal planning labs, and accountability tools.",
  },
  {
    title: "Stay in the loop",
    description:
      "Check your inbox for insider updates, sneak peeks, and early invitations to community events before launch.",
  },
];

export default function ThankYou() {
  const year = new Date().getFullYear();

  return (
    <div className="relative min-h-screen overflow-hidden bg-slate-950 text-slate-100">
      <div className="absolute inset-0 -z-10 bg-[radial-gradient(circle_at_top,_rgba(212,175,55,0.12),transparent_55%),radial-gradient(circle_at_bottom,_rgba(30,64,175,0.26),transparent_60%)]" />
      <main className="mx-auto flex min-h-screen w-full max-w-4xl flex-col px-6 pb-20 pt-24 text-center sm:px-10">
        <section className="space-y-8">
          <p className="text-sm font-semibold uppercase tracking-[0.35em] text-amber-300">
            Thank you
          </p>
          <h1 className="text-4xl font-semibold leading-tight tracking-tight sm:text-5xl">
            You are officially on the WealthIQ waitlist
          </h1>
          <p className="text-lg leading-relaxed text-slate-300">
            We will email you within the next few weeks with your free 3-month subscription and your first look at the app. Keep an eye on your inbox (and maybe your spam folder) so you do not miss the launch.
          </p>
          <div className="mx-auto flex max-w-xl flex-col gap-4 rounded-3xl border border-white/10 bg-white/5 p-8 text-left shadow-[0_30px_70px_-32px_rgba(12,17,29,0.65)]">
            <h2 className="text-base font-semibold text-amber-200">
              What happens next
            </h2>
            <ul className="space-y-4 text-sm leading-relaxed text-slate-200">
              <li className="flex gap-3">
                <span className="inline-flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-amber-400/20 text-sm font-semibold text-amber-200">
                  1
                </span>
                Expect a welcome email confirming your spot and sharing the launch window.
              </li>
              <li className="flex gap-3">
                <span className="inline-flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-amber-400/20 text-sm font-semibold text-amber-200">
                  2
                </span>
                Receive behind the scenes previews of the Golden Hour routine, goal systems, and habit tracking experience.
              </li>
              <li className="flex gap-3">
                <span className="inline-flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-amber-400/20 text-sm font-semibold text-amber-200">
                  3
                </span>
                Get your launch day access code along with instructions to redeem your complimentary subscription.
              </li>
            </ul>
          </div>
        </section>

        <section className="mt-20 grid gap-6 sm:grid-cols-3">
          {highlights.map((item) => (
            <article
              key={item.title}
              className="rounded-3xl border border-white/10 bg-white/[0.06] p-6 text-left transition hover:border-amber-300/50 hover:bg-white/[0.09]"
            >
              <h3 className="text-lg font-semibold text-slate-100">{item.title}</h3>
              <p className="mt-3 text-sm leading-relaxed text-slate-300">
                {item.description}
              </p>
            </article>
          ))}
        </section>

        <section className="mt-20 flex flex-col items-center gap-6 rounded-3xl border border-amber-300/40 bg-amber-400/10 p-10 text-amber-50">
          <h2 className="text-2xl font-semibold tracking-tight">
            Share the mission
          </h2>
          <p className="max-w-2xl text-base text-amber-100">
            Know someone who is ready to upgrade their habits and self-belief? Invite them to join the WealthIQ waitlist so they can launch alongside you.
          </p>
          <a
            href="mailto:?subject=Join%20me%20on%20the%20WealthIQ%20waitlist&body=I%20just%20joined%20the%20WealthIQ%20waitlist%20to%20get%20a%20free%203-month%20membership%20when%20it%20launches.%20You%20should%20grab%20your%20spot%20too:%20https://wealthiq.app"
            className="inline-flex items-center justify-center rounded-full border border-amber-200/60 bg-amber-200/20 px-6 py-3 text-sm font-semibold text-amber-50 transition hover:bg-amber-200/30 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-amber-100"
          >
            Invite a friend
          </a>
          <Link
            href="/"
            className="inline-flex items-center justify-center rounded-full border border-white/20 px-6 py-3 text-sm font-semibold text-slate-100 transition hover:border-amber-200/60 hover:text-amber-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-amber-100"
          >
            Back to WealthIQ home
          </Link>
        </section>

        <footer className="mt-24 border-t border-white/10 pt-8 text-sm text-slate-500">
          <p>Copyright {year} WealthIQ. All rights reserved.</p>
        </footer>
      </main>
    </div>
  );
}
