// @ts-check

/**
 * Safely ignores a Node.js readable stream.
 * @param {import("node:stream").Readable} stream Node.js readable stream.
 */
export function ignoreStream(stream: { on: (arg0: string, arg1: () => void) => void; resume: () => void; }) {
  // Prevent an unhandled error from crashing the process.
  stream.on("error", () => {});

  // Waste the stream.
  stream.resume();
}
