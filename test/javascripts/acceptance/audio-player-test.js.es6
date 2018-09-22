import { acceptance } from "helpers/qunit-helpers";

acceptance("AudioPlayer", { loggedIn: true });

test("AudioPlayer works", async assert => {
  await visit("/admin/plugins/audio-player");

  assert.ok(false, "it shows the AudioPlayer button");
});
