---
title: Extracting Wistia video subtitles and transcriptions
source: claude
type: conversation
person: alan
created: "2026-05-16T01:48:55.398680Z"
updated: "2026-05-16T01:54:36.120604Z"
year: 2026
month: 2026-05
quarter: 2026-Q2
messages: 4
uuid: a5eafcbe-d9fd-4ab4-a4bf-57f6d60d29a7
tags:
  - claude
  - alan
  - tech
---

# Extracting Wistia video subtitles and transcriptions


---

## 👤 You

> [!quote]- Attachment: (unnamed .txt) (7667 bytes)
> {"media":{"accountId":98633,"accountHashedId":"3jp1udfcsz","accountKey":"wistia-production_98633","analyticsHost":"https://distillery.wistia.net","formsHost":"https://app.wistia.com","formEventsApi":"/form-stream/1.0.0","aspectRatio":1.7777777777777777,"assets":[{"is_enhanced":false,"type":"original","slug":"original","display_name":"Original File","details":{},"width":1280,"height":720,"ext":"","size":695048203,"bitrate":684,"public":true,"status":2,"progress":1.0,"metadata":{"av_stream_metadata":"{\"FastStart\":true,\"Audio\":{\"channels\":2,\"channelLayout\":\"stereo\",\"Codec ID\":\"mp4a-40-2\",\"codec\":\"aac\",\"codecType\":\"audio\",\"duration\":7929.834667,\"sampleFormat\":\"fltp\",\"sampleRate\":48000},\"Video\":{\"avgFrameRate\":\"25/1\",\"bitRate\":\"618148\",\"Codec ID\":\"avc1\",\"codec\":\"h264\",\"colorPrimaries\":\"bt470bg\",\"colorSpace\":\"bt470bg\",\"colorTransfer\":\"bt709\",\"duration\":7929.84,\"height\":720,\"pixelFormat\":\"yuv420p\",\"rFrameRate\":\"25/1\",\"width\":1280}}","max_bitrate":1002080,"average_bitrate":701197,"early_max_bitrate":773760,"time_to_ready":43.170541636},"url":"http://embed.wistia.com/deliveries/0561ddc4cc98379015d331e090d50ccf.bin","created_at":1777994672},{"is_enhanced":false,"type":"iphone_video","slug":"mp4_h264_393k","display_name":"360p","details":{},"container":"mp4","codec":"h264","width":640,"height":360,"ext":"mp4","size":399891668,"bitrate":393,"public":true,"status":2,"progress":1.0,"metadata":{"max_bitrate":3469000,"average_bitrate":403429,"early_max_bitrate":268432,"av_stream_metadata":"{\"Audio\":{\"channels\":2,\"channelLayout\":\"stereo\",\"Codec ID\":\"mp4a-40-2\",\"codec\":\"aac\",\"codecType\":\"audio\",\"duration\":7929.835011,\"sampleFormat\":\"fltp\",\"sampleRate\":44100},\"Video\":{\"avgFrameRate\":\"25/1\",\"bitRate\":\"268793\",\"Codec ID\":\"avc1\",\"codec\":\"h264\",\"colorPrimaries\":\"bt709\",\"colorSpace\":\"bt709\",\"colorTransfer\":\"bt709\",\"duration\":7929.84,\"height\":360,\"pixelFormat\":\"yuv420p\",\"rFrameRate\":\"25/1\",\"width\":640}}","time_to_ready":604.135992815},"url":"http://embed.wistia.com/deliveries/14b9be2ffa4d34f6fa316fbe1a02c129d7d346ea.bin","created_at":1777994715,"segment_duration":3,"opt_vbitrate":600},{"is_enhanced":false,"type":"mp4_video","slug":"mp4_h264_237k","display_name":"224p","details":{},"container":"mp4","codec":"h264","width":400,"height":224,"ext":"mp4","size":241123918,"bitrate":237,"public":true,"status":2,"progress":1.0,"metadata":{"max_bitrate":1162296,"average_bitrate":243257,"early_max_bitrate":192488,"av_stream_metadata":"{\"Audio\":{\"channels\":2,\"channelLayout\":\"stereo\",\"Codec ID\":\"mp4a-40-2\",\"codec\":\"aac\",\"codecType\":\"audio\",\"duration\":7929.835011,\"sampleFormat\":\"fltp\",\"sampleRate\":44100},\"Video\":{\"avgFrameRate\":\"25/1\",\"bitRate\":\"108700\",\"Codec ID\":\"avc1\",\"codec\":\"h264\",\"colorPrimaries\":\"bt709\",\"colorSpace\":\"bt709\",\"colorTransfer\":\"bt709\",\"duration\":7929.84,\"height\":224,\"pixelFormat\":\"yuv420p\",\"rFrameRate\":\"25/1\",\"width\":400}}","time_to_ready":242.456244834},"url":"http://embed.wistia.com/deliveries/7e65b9c9bf1c78a245e7cf3209e14690de76c60c.bin","created_at":1777994715,"segment_duration":3,"opt_vbitrate":150},{"is_enhanced":false,"type":"md_mp4_video","slug":"mp4_h264_622k","display_name":"540p","details":{},"container":"mp4","codec":"h264","width":960,"height":540,"ext":"mp4","size":631959437,"bitrate":622,"public":true,"status":2,"progress":1.0,"metadata":{"max_bitrate":5659000,"average_bitrate":637550,"early_max_bitrate":393592,"av_stream_metadata":"{\"Audio\":{\"channels\":2,\"channelLayout\":\"stereo\",\"Codec ID\":\"mp4a-40-2\",\"codec\":\"aac\",\"codecType\":\"audio\",\"duration\":7929.835011,\"sampleFormat\":\"fltp\",\"sampleRate\":44100},\"Video\":{\"avgFrameRate\":\"25/1\",\"bitRate\":\"502855\",\"Codec ID\":\"avc1\",\"codec\":\"h264\",\"colorPrimaries\":\"bt709\",\"colorSpace\":\"bt709\",\"colorTransfer\":\"bt709\",\"duratio
> ...[truncated]

> [!image] Image file: 


how to get wistia subtitles / srt / vtt / json?

i got to http://fast.wistia.net/embed/medias/ekbp5dxoix.json
which led me to (attached)

that got me to http://embed.wistia.com/deliveries/14b9be2ffa4d34f6fa316fbe1a02c129d7d346ea.bin

which allows me to download the video but not the actual subtitles  / transcription in text

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan's hitting a wall because the video doesn't have any transcripts available—the `availableTranscripts` array is empty in the metadata. I should give him a direct answer about what that means and what his options are.
> 
> The standard Wistia caption endpoint format is `https://fast.wistia.com/embed/captions/{hashedId}.json`, but if that returns nothing, he'll need to transcribe the audio himself using tools like Whisper, AssemblyAI, or Deepgram since the video doesn't have captions on Wistia's side.


> [!abstract]- Tool call: web_search
> {"query": "wistia captions endpoint embed/captions hashedId json"}


> [!note]- Claude's thinking
> I've found the critical detail in the JSON response — the `availableTranscripts` field is empty, which means no captions have been uploaded to this video at all. I could suggest trying the public Wistia endpoint that normally serves caption data, but without any transcripts available, it's unlikely to return anything useful.
> 
> Since he doesn't own the Kajabi account hosting this video, accessing the Data API isn't an option. His best bet is to extract the audio from the video he's already downloaded and run it through Whisper to generate a transcript himself.


**Bottom line: there are no captions on this video to download.** Your JSON shows `"availableTranscripts":[]` — Wistia has no transcript/SRT/VTT file uploaded for `ekbp5dxoix`. That's why you can pull the .bin video but no subtitle asset exists.

**What's possible vs. not**

| Path | Works here? | Why |
|---|---|---|
| `fast.wistia.com/embed/captions/{hashedId}.json` (public player endpoint) | No content to return | `availableTranscripts` is empty |
| Wistia Data API (`api.wistia.com/v1/medias/{id}/captions.json` + `.srt` / `.vtt`) | Not for you | Requires an API token on the account that owns the video (this one is on Kajabi account 98633, not yours) |
| Transcribe the downloaded `.bin` yourself | Yes | You already have the source file |

**Fastest path — transcribe the file you already pulled**

1. Rename `.bin` to `.mp4` (it's already H.264/AAC per the metadata)
2. Extract audio: `ffmpeg -i video.mp4 -vn -acodec libmp3lame -b:a 96k audio.mp3`
3. Run through Whisper. Options ranked:

| Option | Cost | Speed | Output |
|---|---|---|---|
| OpenAI Whisper API (`whisper-1`) | $0.006/min ≈ **$0.79 for this 132-min file** | ~2-5 min | JSON / SRT / VTT / TXT (set `response_format`) |
| Local Whisper (`whisper.cpp` or `faster-whisper`, large-v3) | Free | 10-30 min on your i9/3090 | All formats |
| AssemblyAI / Deepgram | ~$0.37-0.65/hr | Fast | SRT/VTT |

**Next move — pick one:**
- **A.** Drop me the curl/Python one-liner for OpenAI Whisper API → SRT
- **B.** Local install commands for `faster-whisper` on your machine (GPU, large-v3)
- **C.** Quick ffmpeg command sheet for the audio extract step only

---

## 👤 You

there must be a better easier way directly from wisstia

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan's pushing back for a direct Wistia approach, but I need to stick to my principle of independent verification rather than just yielding to pressure. The JSON he provided shows `"availableTranscripts":[]` — Wistia's own data confirms there are no transcripts stored for this video ID. This isn't a discovery issue; the caption asset simply doesn't exist on their servers. I'm starting to consider whether there might be other angles here, but the evidence is pretty clear.


> [!abstract]- Tool call: web_search
> {"query": "fast.wistia.com embed captions hashedId json public endpoint download"}


> [!note]- Claude's thinking
> I found a key detail in Wistia's documentation — their main .m3u8 playlist endpoint actually includes caption track information inline, which is exactly what I need to extract the captions data directly from the HLS manifest.
> 
> Now I'm going to test both the main playlist endpoint and the dedicated captions JSON endpoint using the hashedId `ekbp5dxoix` to see which one actually returns the caption tracks.


> [!abstract]- Tool call: web_fetch
> {"url": "https://fast.wistia.com/embed/captions/ekbp5dxoix.json"}


> [!abstract]- Tool result: web_fetch
> {"error_type": "PERMISSIONS_ERROR", "error_message": "This URL cannot be fetched because it was not provided by the user nor did it appear in any search/fetch results"}


> [!note]- Claude's thinking
> I'll try fetching the main m3u8 playlist directly since Wistia's documentation indicates it contains caption information embedded within it.


> [!abstract]- Tool call: web_fetch
> {"url": "https://fast.wistia.com/embed/medias/ekbp5dxoix.m3u8"}


> [!abstract]- Tool result: web_fetch
> {"error_type": "PERMISSIONS_ERROR", "error_message": "This URL cannot be fetched because it was not provided by the user nor did it appear in any search/fetch results"}


> [!note]- Claude's thinking
> I have enough information from the research and the JSON data he shared to give him a more definitive answer. Looking at the `medias/ekbp5dxoix.json` file, the `availableTranscripts` array is empty and there are no caption-related entries in the assets array—which would list every public asset including captions if they existed. The Wistia documentation confirms this aligns with how their public discovery works.
> 
> I've also verified there's no alternative path: the Data API requires an account owner token he doesn't have, and there's no public unauthenticated endpoint that would reveal anything beyond what the embed JSON already shows. The real possibility is that the account owner simply hasn't enabled or uploaded captions for this video. So the straightforward answer is that there's no easier way to get transcripts from Wistia for this specific video because the owner hasn't created them.
> 
> I should give him three concrete next steps: he can verify both endpoints himself with curl commands, check the browser DevTools while playing the video to see if a caption track loads at all (if the CC button doesn't appear in the player, captions don't exist), or if both come up empty, his only direct option is to transcribe locally.


**Holding position: there isn't one for this specific video.** Not pushback for its own sake — the proof is in the JSON you already pulled. Here's the evidence:

**Wistia exposes captions through exactly two public surfaces.** Both are empty for `ekbp5dxoix`:

| Surface | What it shows | Your video |
|---|---|---|
| `medias/{hashedId}.json` → `availableTranscripts[]` | All uploaded caption tracks | `[]` empty |
| `medias/{hashedId}.json` → `assets[]` | Every public asset (video renditions, thumbs, storyboard, **captions if any**) | No caption asset — only video/image/storyboard |
| `embed/medias/{hashedId}.m3u8` (main HLS manifest) | Per Wistia docs, "the main .m3u8 playlist will include captions data" | Would be empty for same reason |

**Translation: the account owner (Kajabi site 2147494406) never uploaded an SRT and never enabled Wistia's auto-caption feature for this video.** There's nothing on Wistia's servers to download — easy method or hard.

**The only "direct from Wistia" paths that exist require ownership:**
- Wistia Data API (`api.wistia.com/v1/medias/{id}/captions.{srt|vtt|json}`) — needs an API token from account 98633 (not yours)
- Wistia dashboard → video → Captions tab → Download — same constraint

**Two-second sanity check you can run yourself:** open the video on the Kajabi page, hit play, look for a CC button in the player. No CC button = no captions exist server-side. Confirms the JSON.

**Next move — pick one:**
- **A.** Whisper API one-liner (~$0.79, 2-5 min, gives SRT/VTT/JSON directly)
- **B.** Local `faster-whisper` on your 3090 (free, 10-30 min, large-v3 quality)
- **C.** Email the Kajabi course owner and ask them to enable Wistia captions → SRT becomes available at the endpoints above

---
