import "../globals.css";

export const metadata = {
  title: "Liberty Senior Accountant Strategic Tax & Advisory",
  description: "Strategic tax planning, preparation, and advisory—nationwide.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
