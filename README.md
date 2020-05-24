<!-- markdownlint-configure-file { "MD013": { "line_length": 120 } } -->
<!-- [![Release][github-release-image]][github-release-link] -->
<!-- [![Docker image][docker-build-image]][docker-build-link] -->
[![Status][gha-image-action-master]][gha-link-action-master]
[![Status][gha-image-docker-master]][gha-link-docker-master]
[![Status][gha-image-lint-master]][gha-link-lint-master]
[![][tg-channel-image]][tg-channel-link]
[![][tg-chat-image]][tg-chat-link]
[![Edit][gitpod-image]][gitpod-link]

# FX Data Convert Action

This GitHub Action can convert Forex historical data to different formats (such as CSV, HST, FXT or HCC).

## Supported formats

Supported input formats:

- CSV

Supported output formats:

- FXT
- HST
- HCC

## Main Inputs

### `InputFile`

The CSV filename to convert from.

### `OutputFormat`

The format of the file to convert to.

Supported output formats: `fxt`, `hst` and `hcc`.

<!--
## Outputs

### `foo`

Foo bar.
-->

## Example usage

```yaml
uses: ea31337/fx-data-convert-action@master
with:
  InputFile: 'myfile.csv'
  OutputFormat: 'fxt'
```

### Support

- For bugs/features, raise a [new issue at GitHub](https://github.com/EA31337/FX-Data-Convert-Action/issues).
- Join our [Telegram group](https://t.me/EA31337) and [channel](https://t.me/EA31337_Announcements) for help.

<!-- Named links -->

[github-release-image]: https://img.shields.io/github/release/EA31337/FX-Data-Convert-Action.svg?logo=github
[github-release-link]: https://github.com/EA31337/FX-Data-Convert-Action/releases
<!-- Telegram links -->
[tg-channel-image]: https://img.shields.io/badge/Telegram-news-0088CC.svg?logo=telegram
[tg-channel-link]: https://t.me/EA31337_News
[tg-chat-image]: https://img.shields.io/badge/Telegram-chat-0088CC.svg?logo=telegram
[tg-chat-link]: https://t.me/EA31337
<!-- GitHub Actions build links -->
[gha-link-action-master]: https://github.com/EA31337/FX-Data-Convert-Action/actions?query=workflow%3AAction@master+branch%3Amaster
[gha-image-action-master]: https://github.com/EA31337/FX-Data-Convert-Action/workflows/Action@master/badge.svg
[gha-link-docker-master]: https://github.com/EA31337/FX-Data-Convert-Action/actions?query=workflow%3ADocker+branch%3Amaster
[gha-image-docker-master]: https://github.com/EA31337/FX-Data-Convert-Action/workflows/Docker/badge.svg
[gha-link-lint-master]: https://github.com/EA31337/FX-Data-Convert-Action/actions?query=workflow%3ALint+branch%3Amaster
[gha-image-lint-master]: https://github.com/EA31337/FX-Data-Convert-Action/workflows/Lint/badge.svg
<!-- Gitpod links -->
[gitpod-image]: https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod
[gitpod-link]: https://gitpod.io/#https://github.com/EA31337/FX-Data-Convert-Action
