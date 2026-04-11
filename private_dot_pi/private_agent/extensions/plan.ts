import type { ExtensionAPI } from "@mariozechner/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.registerCommand("plan", {
    description: "Ask the agent to create a detailed execution plan",
    handler: async (args, ctx) => {
      const topic = args ? ` for the following: ${args}` : " for the current objective";
      
      ctx.ui.notify("Requesting execution plan...", "info");
      
      pi.sendUserMessage(
        `Please create a detailed execution plan${topic}. ` +
        "Break the work down into small, atomic steps. " +
        "For each step, specify the expected outcome and how it will be verified. " +
        "End with a clear 'Definition of Done' for the entire task."
      );
    },
  });
}
