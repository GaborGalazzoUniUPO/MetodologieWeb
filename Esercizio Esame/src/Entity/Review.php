<?php


namespace Entity;


class Review
{

    /**
     * @var string
     */
    private $author;
    /**
     * @var int
     */
    private $vote;
    /**
     * @var string
     */
    private $content;
    /**
     * @var \DateTime
     */
    private $created_at;

    /**
     * @return string
     */
    public function getAuthor(): string
    {
        return $this->author;
    }

    /**
     * @param string $author
     */
    public function setAuthor(string $author): void
    {
        $this->author = $author;
    }

    /**
     * @return int
     */
    public function getVote(): int
    {
        return $this->vote;
    }

    /**
     * @param int $vote
     */
    public function setVote(int $vote): void
    {
        $this->vote = $vote;
    }

    /**
     * @return string
     */
    public function getContent(): string
    {
        return $this->content;
    }

    /**
     * @param string $content
     */
    public function setContent(string $content): void
    {
        $this->content = $content;
    }

    /**
     * @return \DateTime
     */
    public function getCreatedAt(): \DateTime
    {
        return new \DateTime($this->created_at);
    }

    /**
     * @param \DateTime $created_at
     */
    public function setCreatedAt(\DateTime $created_at): void
    {
        $this->created_at = $created_at;
    }



}