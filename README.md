# Cloudphoto

Command line utility for managing photos in AWS S3.

## Installation

Install gem from command line:

```bash
gem install cloudphoto
```

## Usage

#### Configure environment vairables:

```bash
export AWS_REGION=us-east-1
```
see list of available regions [here](https://docs.aws.amazon.com/general/latest/gr/rande.html).

Configure AWS credentials in `~/.aws/credentials`
(see this [blog post](https://aws.amazon.com/blogs/security/a-new-and-standardized-way-to-manage-credentials-in-the-aws-sdks/)).

Provide bucket name
```bash
export CLOUDPHOTO_BUCKET=cloudphoto1
```

or pass it to executable
```bash
CLOUDPHOTO_BUCKET=photos cloudphoto list
```

### Upload pictures to cloud storage

Uploads all the photos (in jpeg/jpg format) from `path` directory (not recursively)
and adds them to `album` album.

```bash
cloudphoto upload -p path -a album
```

### Download pictures to have it locally

Downloads all the pictures related to `album` album to `path` directory.

```bash
cloudphoto download -p path -a album
```

### List albums in cloud storage

```bash
cloudphoto list
```

### List specific album photos in cloud storage

```bash
cloudphoto list -a album
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DmitryBarskov/cloudphoto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/DmitryBarskov/cloudphoto/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cloudphoto project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/DmitryBarskov/cloudphoto/blob/master/CODE_OF_CONDUCT.md).
