import cors from "cors";
import express from "express";
import helmet from "helmet";

const app = express();
const port = process.env.PORT ?? 3000;
let counter = 0;

app.use(cors());
app.use(express.json());
app.use(helmet());

app.get("/date", async (_, res) => {
  counter++;
  console.log("received a request", { counter });

  const date_ob = new Date();
  const date = ("0" + date_ob.getDate()).slice(-2);
  const month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  const year = date_ob.getFullYear();
  const hours = date_ob.getHours();
  const minutes = date_ob.getMinutes();
  const seconds = date_ob.getSeconds();

  // simulate a 404 on a GET request for every 5th request
  if (counter % 2 === 0) {
    // we are randomly adding some delays to test if this makes any difference
    if (Math.random() > 0.5) await sleep(10);
    return res.status(404).json();
  }

  return res
    .status(200)
    .json(`${year}-${month}-${date} ${hours}:${minutes}:${seconds}`);
});

app.listen(port, () => console.debug(`started listening on ${port}`));

const sleep = (seconds: number) =>
  new Promise((resolve) => setTimeout(resolve, seconds * 1000));
