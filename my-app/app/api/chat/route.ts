import { google } from "@ai-sdk/google";
import { streamText } from "ai";

export const runtime = "edge";

export async function POST(req: Request) {
  const { messages } = await req.json();

  const result = streamText({
    model: google("models/gemini-1.5-flash"), // ✅ supported
    messages,
  });

  return result.toUIMessageStreamResponse();
}
