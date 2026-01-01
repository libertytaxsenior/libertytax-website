export default function Page() {
  return (
    <main style={{ padding: 48, fontFamily: "system-ui" }}>
      <h1 style={{ fontSize: 36, marginBottom: 12 }}>
        Liberty Senior Accountant Strategic Tax & Advisory
      </h1>

      <p style={{ fontSize: 18, maxWidth: 900, lineHeight: 1.6 }}>
        Strategic tax planning, preparation, and advisory services — serving
        individuals and businesses nationwide.
      </p>

      <div style={{ marginTop: 24, display: "flex", gap: 12, flexWrap: "wrap" }}>
        <a
          href="https://clients.friersoncfo.com"
          style={{
            padding: "12px 16px",
            background: "#0f172a",
            color: "white",
            borderRadius: 10,
            textDecoration: "none",
          }}
        >
          Client Portal (SuiteDash)
        </a>

        <a
          href="/get-started"
          style={{
            padding: "12px 16px",
            border: "1px solid #cbd5e1",
            borderRadius: 10,
            textDecoration: "none",
            color: "#0f172a",
          }}
        >
          Get Started
        </a>
      </div>
    </main>
  );
}
