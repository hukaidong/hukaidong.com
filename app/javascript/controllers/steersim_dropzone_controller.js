import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["dropzone", "plot"];

    connect() {
        let plotTarget = this.plotTarget;

        $(this.dropzoneTarget).dropzone(
            {
                maxFiles: 1,
                maxFilesize: 1,
                success: function (file, response) {
                    plotTarget.innerHTML = response.content;
                    this.removeAllFiles(true);
                }
            }
        );

        $(".dz-button").addClass("ui blue button");

    }
}