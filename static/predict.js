async function send_review() {
    const request = await fetch("/sendreview", {
        method: "POST",
        body: new FormData(document.querySelector("form"))
    });

    const response = await request.json();
    console.log(response);
    document.getElementById("prediction").innerHTML = response.prediction === 1 ? ":) - Good!" : ":( - Bad!";
}