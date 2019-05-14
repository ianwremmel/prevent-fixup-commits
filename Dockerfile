FROM bash

LABEL version="1.0.0"
LABEL repository="http://github.com/ianwremmel/prevent-fixup-commits"
LABEL homepage="http://github.com/ianwremmel/prevent-fixup-commits"
LABEL maintainer="Ian Remmel <1182361+ianwremmel@users.noreply.github.com>"

LABEL com.github.actions.name="Prevent fixup! commits"
LABEL com.github.actions.description="Prevents you from merging fixup! commits into master."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["entrypoint.sh"]