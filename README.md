# FX Data Convert 🐳 Action

<!-- [![Docker image][docker-build-image]][docker-build-link] -->
[![Release][github-release-image]][github-release-link]
[![Status][gha-image-action-master]][gha-link-action-master]
[![Status][gha-image-check-master]][gha-link-check-master]
[![Status][gha-image-docker-master]][gha-link-docker-master]
[![Status][gha-image-lint-master]][gha-link-lint-master]
[![Telegram Channel][tg-channel-image]][tg-channel-link]
[![Telegram Chat][tg-chat-image]][tg-chat-link]
[![Edit][gitpod-image]][gitpod-link]

This GitHub Action allows Forex historical data to be converted to different formats.

Supported formats:

- CSV
- HST (historical data, e.g. OHLC values)
- HST v509 (older version)
- FXT (tick data for MetaTrader 4)
- HCC (tick data for MetaTrader 5)

## Usage

For full documentation, please read: [GitHub Actions Documentation](https://help.github.com/en/actions).

### Latest release

```yaml
uses: fx31337/fx-data-convert-action@v1
```

### Specific release

```yaml
uses: fx31337/fx-data-convert-action@v1.0.0
```

Note: Check *Releases* for more details.

### Latest development version

```yaml
uses: fx31337/fx-data-convert-action@master
```

### Specifying inputs

Example:

```yaml
uses: fx31337/fx-data-convert-action@master
with:
    InputFile: 'myfile.csv'
    OutputFormat: 'fxt'
```

## Inputs

### Main Inputs

#### `InputFile`

The CSV filename to convert from.

#### `OutputFormat`

The format of the file to convert to.

Supported output formats: `fxt`, `hst` and `hcc`.

#### `ModelingMode`

Mode of modeling price (for FXT format only).

Supported modes:

- `0` - Every tick (default)
- `1` - Control points
- `2` - Open prices

#### `Pair`

Symbol pair code (e.g. `EURUSD`, default: `FOOBAR`).

### Other Inputs

#### `CmdArgs`

Extra arguments to pass to the script. Default: `-v` (for verbose output).

#### `OptVerbose`

Specifies level of verbosity (0-2).

Supported levels are:

- 0 - no output
- 1 - standard messages
- 2 - debug messages
- 3 - trace messages

<!--
## Outputs

### `foo`

Foo bar.
-->

## Support

- For bugs/features, raise a [new issue at GitHub](https://github.com/FX31337/FX-Data-Convert-Action/issues).
- Join our [Telegram group](https://t.me/FX31337) and [channel](https://t.me/FX31337_Announcements) for help.

<!-- Named links -->

[github-release-image]: https://img.shields.io/github/release/FX31337/FX-Data-Convert-Action.svg?logo=github
[github-release-link]: https://github.com/FX31337/FX-Data-Convert-Action/releases

[tg-channel-image]: https://img.shields.io/badge/Telegram-news-0088CC.svg?logo=telegram
[tg-channel-link]: https://t.me/EA31337_News
[tg-chat-image]: https://img.shields.io/badge/Telegram-chat-0088CC.svg?logo=telegram
[tg-chat-link]: https://t.me/EA31337

[gha-link-action-master]: https://github.com/FX31337/FX-Data-Convert-Action/actions?query=workflow%3AAction+branch%3Amaster
[gha-image-action-master]: https://github.com/FX31337/FX-Data-Convert-Action/workflows/Action/badge.svg
[gha-link-check-master]: https://github.com/FX31337/FX-Data-Convert-Action/actions?query=workflow%3ACheck+branch%3Amaster
[gha-image-check-master]: https://github.com/FX31337/FX-Data-Convert-Action/workflows/Check/badge.svg
[gha-link-docker-master]: https://github.com/FX31337/FX-Data-Convert-Action/actions?query=workflow%3ADocker+branch%3Amaster
[gha-image-docker-master]: https://github.com/FX31337/FX-Data-Convert-Action/workflows/Docker/badge.svg
[gha-link-lint-master]: https://github.com/FX31337/FX-Data-Convert-Action/actions?query=workflow%3ALint+branch%3Amaster
[gha-image-lint-master]: https://github.com/FX31337/FX-Data-Convert-Action/workflows/Lint/badge.svg

[gitpod-image]: https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod
[gitpod-link]: https://gitpod.io/#https://github.com/FX31337/FX-Data-Convert-Action
