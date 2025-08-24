// main.ts

const SCRIPT_PATH = "./install.sh";
const URL_PATH = "/install.sh";
const CACHE_MAX_AGE = 3600;

let scriptContent: Uint8Array;
try {
  scriptContent = await Deno.readFile(SCRIPT_PATH);
} catch (error) {
  if (error instanceof Deno.errors.NotFound) {
    console.error(`Error: Script not found at ${SCRIPT_PATH}`);
  } else {
    console.error(`Error reading script at ${SCRIPT_PATH}:`, error);
  }
  Deno.exit(1);
}

Deno.serve({ port: 8000 }, (req: Request) => {
  if (req.method === "GET" && new URL(req.url).pathname === URL_PATH) {
    return new Response(scriptContent, {
      headers: {
        "Content-Type": "text/plain; charset=utf-8",
        "Cache-Control": `public, max-age=${CACHE_MAX_AGE}`,
      },
    });
  }
  return new Response("Not Found", { status: 404 });
});
